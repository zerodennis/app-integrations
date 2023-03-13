import React, { useEffect, useState } from "react";
import {
  Checkbox,
  FormGroup,
  FormControlLabel,
  Container,
  Button,
  InputAdornment,
  TextField,
  Icon,
  Modal,
  Box,
  Pagination,
  PaginationItem,
} from '@mui/material';
import { styled } from '@mui/system';
import PopperMenu from "./common/PopperMenu";
import { Card } from './common/Card';
import { EmptyState } from './EmptyState';
import { fetchPage, fetchShuffled } from "../api/app-integrations";
import { fetchTags } from '../api/tags';

const DEFAULT_PAGE = 1;
const DEFAULT_LIMIT = 10;

const StyledPagination = styled(Pagination) ({
  '& .Mui-selected': {
    backgroundColor: '#4B68FE !important',
    color: 'white',
  },
});

export const Home = () => {
  const root = document.getElementById('root');
  const { baseUrl } = root.dataset;
  const [isModalOpen, setIsModalOpen] = useState(false);
  const [apps, setApps] = useState(null);
  const [isLoading, setLoading] = useState(true);
  const [tags, setTags] = useState([]);
  const [selectedTags, setSelectedTags] = useState([]);
  const [tagsById, setTagsById] = useState({});
  const [params, setParams] = useState({
    q: '',
    page: DEFAULT_PAGE,
    limit: DEFAULT_LIMIT,
   });

  useEffect(() => {
    doFetchTags();
    renderTagFilters();
    fetchShuffledEntries();
  }, []);

  useEffect(() => {
    fetchApps();
  }, [params]);

  const fetchShuffledEntries = async () => {
    const result = await fetchShuffled(baseUrl, params);
    setApps(result);
    setLoading(false);
  }

  const fetchApps = async () => {
    const result = await fetchPage(baseUrl, params);
    setApps(result);
    setLoading(false);
  };

  const doFetchTags = async () => {
    const result = await fetchTags(baseUrl);
    const resultsByTagId = result.reduce((item, v, _k) => {
      return Object.assign(item, { [v.tag_id]: v.name})
    }, {});

    setTagsById(resultsByTagId);
    setTags(result);
  };

  const changePage = (_e, p) => {
    setParams({ ...params, page: p });
    window.scrollTo(0, 0);
  };

  const renderTagFilters = () => {
    if (!tags || tags.length < 1) return;

    return (
      <div style={styles.filter_container}>
        {tags.map(tag => (
          <FormControlLabel
            control={
              <Checkbox
                id={`checkbox-${tag.tag_id}`}
                checked={selectedTags.includes(tag.tag_id)}
                onChange={() => handleCheckbox(tag)}
              />
            }
            label={tag.name}
            key={tag.tag_id}
          />
        ))}
      </div>
    )
  };

  const renderTagNames = app => {
    return app.tag_ids.map(tagId => tagsById[tagId]).join(', ');
  };

  const handleCheckbox = val => {
    if (selectedTags.includes(val.tag_id)) {
      const _selectedTags = selectedTags.filter(
        o => o !== val.tag_id
      );
      setSelectedTags(_selectedTags);
      // setParams({ ...params, tagIds: JSON.stringify(_selectedTags)});
      // the above would have applied the filter upon ticking a checkbox
      // which is something i like better
    } else {
      const _selectedTags = [...selectedTags, val.tag_id];
      setSelectedTags(_selectedTags);
      // setParams({ ...params, tagIds: JSON.stringify(_selectedTags)});
      // the above would have applied the filter upon ticking a checkbox
      // which is something I like better
    }
  }

  const handleModal = () => {
    setIsModalOpen(!isModalOpen);
  };

  const renderCardItems = () => {
    if (isLoading) return;

    return (
      apps.app_integrations.map((app, _index) => (
        <Card
          title={app.name}
          key={app.app_integration_id}
          description={app.description}
          subtitle={renderTagNames(app)}
          footerText="Notify me when it's ready"
          avatarURL={app.avatar_url}
          onFooterClick={handleModal}
        />
      ))
    )
  };

  const renderFeed = () => {
    if (isLoading) return;
    if (apps && apps.app_integrations.length > 0) {
      return (
        <div id="feed" className='gallery'>
          {renderCardItems()}
        </div>
      )
    } else {
      return (
        <EmptyState />
      )
    }
  };

  const renderHeader = () => {
    if (!apps || apps.app_integrations.length < 1) return;

    const start = (apps.page_number - 1) * (apps.page_size) + 1;
    let end = start + apps.page_size - 1;
    if (end < apps.page_size) {
      end = apps.page_size
    } else if (end > apps.total_entries) {
      end = apps.total_entries;
    }
    return (
      <h2 style={{ paddingTop: '8px' }}>
        {`Showing ${start} - ${end} of ${apps.total_entries} apps`}
      </h2>
    )
  }

  return (
    <div id="home-container" style={{ backgroundColor: '#F4F7F9' }}>
      <img style={{ width: '100%', height: 'auto' }}src="/images/hero-image.svg" />
      <Container maxWidth="xl">
      {renderHeader()}
      <div className='search-container'>
        <TextField
          id="search-text-input"
          value={params.q}
          style={{ backgroundColor: 'white', minWidth: '304px' }}
          onChange={e => setParams({ ...params, q: e.target.value })}
          InputProps={{
            startAdornment: (
              <InputAdornment position="start">
                <Icon>search</Icon>
              </InputAdornment>
            )
          }}
        />
        <PopperMenu
          onConfirm={() => {
            setParams({...params, tagIds: JSON.stringify(selectedTags)})
          }}
        >
          <FormGroup>
            {renderTagFilters()}
          </FormGroup>
        </PopperMenu>
      </div>
      {renderFeed()}
      {
        !isLoading && apps && apps.app_integrations.length > 0 && (
          <StyledPagination
            sx={{ py: 4 }}
            size="large"
            page={params.page}
            renderItem={(item) => (<PaginationItem {...item} sx={{ color: '#828282' }} />)}
            count={apps.total_pages || 1}
            onChange={changePage}
          />
        )
      }
      <Modal
        open={isModalOpen}
        onClose={handleModal}
      >
        <Box sx={styles.modal}>
          <div style={{ textAlign: 'right' }}>
            <Icon onClick={handleModal} style={{ cursor: 'pointer' }}>close</Icon>
          </div>
          <h2>Thank you for your interest</h2>
          <p>
            We're still working on integrating this app and it's not yet ready for now.
            But you can send us your email so we can let you know when it's ready.
          </p>
          <TextField variant='outlined' label="Email" />
          <div style={styles.modalFooter}>
            <Button
              variant='outlined'
              onClick={handleModal}
              sx={{ border: '1px solid #4B68FE', color: '#4B68FE', marginRight: '8px' }}
            >
              <span style={{ textTransform: 'none' }}>Never mind</span>
            </Button>
            <Button
              variant='contained'
              startIcon={<Icon>near_me</Icon>}
              sx={{ backgroundColor: '#4B68FE' }}
            >
              Notify Me
            </Button>
          </div>
        </Box>
      </Modal>
    </Container>
    </div>

  );
};

const styles = {
  filter_container: {
    display: 'flex',
    flexDirection: 'column',
  },
  filter_buttons_container: {
    display: 'flex',
    flexDirection: 'row',
    justifyContent: 'flex-end',
  },
  modal: {
    position: 'absolute',
    top: '50%',
    left: '50%',
    transform: 'translate(-50%, -50%)',
    width: 560,
    bgcolor: 'background.paper',
    border: 'none',
    boxShadow: 24,
    p: 4,
    borderRadius: '4px',
  },
  modalFooter: {
    display: 'flex',
    justifyContent: 'flex-end',
    alignItems: 'center',
    paddingTop: '16px',
  }
};
