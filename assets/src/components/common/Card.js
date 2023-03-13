import React from 'react';
import { Icon } from '@mui/material';

export const Card = ({ avatarURL, title, subtitle, description, footerText, onFooterClick }) => {
  return (
    <div className='card'>
      <div className='header'>
        <img src={avatarURL} />
        <div className='header-text'>
          <div className='title'>
            { title }
          </div>
          <div className='subtitle'>
            { subtitle }
          </div>
        </div>
      </div>
      <div className='description'>
        <div className='description-text'>
          { description }
        </div>
      </div>
      <div className='footer' style={styles.footer}>
        <div onClick={onFooterClick} style={styles.footerContent}>
          { footerText }
          <Icon>chevron_right</Icon>
        </div>
      </div>
    </div>
  )
};

const styles = {
  footerContent: {
    fontWeight: 700,
    fontSize: '16px',
    lineHeight: '24px',
    color: '#4B68FE',
    cursor: 'pointer',
    display: 'flex',
    alignItems: 'center',
  },
};
