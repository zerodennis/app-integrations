import React from 'react';

export const EmptyState = () => {
  return (
    <div id="empty-state" style={styles.container}>
      <img src='/images/empty-state.svg' />
      <p style={styles.text}>Try changing the filters or search terms</p>
    </div>
  )
}

const styles = {
  container: {
    width: '100%',
    height: 'auto',
    display: 'flex',
    flexDirection: 'column',
    textAlign: 'center',
    alignItems: 'center',
    justifyContent: 'center',
  },
  text: {
    color: '#828282',
    fontSize: '12px',
    fontWeight: 400,
    fontFamily: 'Inter',
    paddingTop: '16px',
  }
}