import React from 'react';
import { render, screen } from '@testing-library/react';
import { Home } from '../src/components/Home';

describe('Home', () => {
  beforeEach(() => {
    fetchMock.resetMocks();
  })

  test("renders", () => {
    render(<Home />);
  });

  test('renders a list of all apps', async () => {
    const apps = [
      {total_entries: 21, page: 1, page_size: 10, app_integrations: [
        {app_integration_id: '1', name: 'app 1', tag_ids: [], avatar_url: '', description: ''}
      ]}
    ];

    const tags = [
      {tag_id: '1', name: 'tag 1'}
    ];

    fetchMock.mockResolvedValue({ status: 200, json: jest.fn(() => apps)});
    fetchMock.mockResolvedValue({ status: 200, json: jest.fn(() => tags)});

    render(<Home />);

    expect(await screen.findByText('app 1')).toBeInTheDocument();
  })
});
