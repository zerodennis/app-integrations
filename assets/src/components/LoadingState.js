import React from 'react';
import { Progress } from '@mui/material';

export const LoadingState = () => {
  return (
    <div style={styles.container}>
      <Progress sx={{color: '#4B68FE'}} />
    </div>
  )
};

const styles = {
  container: {
    width: '100vw',
    height: '100vw',
    display: 'flex',
    alignItems: 'center',
    justifyContent: 'center',
  }
};
