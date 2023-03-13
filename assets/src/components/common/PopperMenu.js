import * as React from 'react';
import Box from '@mui/material/Box';
import Popper from '@mui/material/Popper';
import Icon from '@mui/material/Icon';
import Button from '@mui/material/Button';
import { styled } from '@mui/material/styles';

export default function PopperMenu({ children, onConfirm }) {
  const [anchorEl, setAnchorEl] = React.useState(null);

  const handleClick = (event) => {
    setAnchorEl(anchorEl ? null : event.currentTarget);
  };

  const open = Boolean(anchorEl);
  const id = open ? 'popper-menu' : undefined;

  return (
    <div>
      <DropDownButton id="dropdown-filter-button" aria-describedby={id} type="button" onClick={handleClick}>
        Filter
        <Icon style={{ marginBottom: '2px' }}>arrow_drop_down</Icon>
      </DropDownButton>
      <Popper id={id} open={open} anchorEl={anchorEl}>
        <Box sx={{ border: 1, py: 1, px: 2, bgcolor: 'background.paper', width: 300, borderRadius: '4px' }}>
        <div id="popper-filter-box" style={{ display: 'flex', width: '100%', justifyContent: 'space-between', alignItems: 'center' }}>
          <h4>
            FILTERS
          </h4>
          <Icon sx={{ cursor: 'pointer' }} onClick={handleClick}>close</Icon>
        </div>
        { children }
          <div style={styles.filter_buttons_container}>
            <Button onClick={handleClick} sx={{ color: '#4B68FE' }} variant="text">Cancel</Button>
            <Button id="filter-submit" onClick={onConfirm} sx={{ backgroundColor: '#4B68FE' }} variant="contained">Apply</Button>
          </div>
        </Box>
      </Popper>
    </div>
  );
}

const styles = {
  filter_buttons_container: {
    display: 'flex',
    flexDirection: 'row',
    justifyContent: 'flex-end',
  },
}

const DropDownButton = styled(Button) ({
  background: '#F4F7F9',
  borderTopRightRadius: '4px',
  borderBottomRightRadius: '4px',
  color: '#828282',
  alignItems: 'center',
  height: '100%',
  border: '1px solid #BDBDBD',
  borderLeft: 'none',
  height: '56px',
  textTransform: 'none',
})