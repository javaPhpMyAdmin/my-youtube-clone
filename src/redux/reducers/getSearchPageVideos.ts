import { createAsyncThunk } from '@reduxjs/toolkit';
import axios from 'axios';
import { parseData, YOUTUBE_API_URL } from '@/utils';
import { HomePageVideos } from '@/Types';
import { RootState } from '..';

const API_KEY = import.meta.env.VITE_YOUTUBE_APIKEY;

export const getSearchPageVideos = createAsyncThunk(
  'youtubeApp/searchPageVideos',
  async (isNext: boolean, { getState }) => {
    const {
      youtubeApp: { nextPageToken: nextPageTokenFromState, videos, searchTerm },
    } = getState() as RootState;
    const {
      data: { items, nextPageToken },
    } = await axios.get(
      `${YOUTUBE_API_URL}/search?q=${searchTerm}&key=${API_KEY}&part=snippet&type=video&${
        isNext ? `pageToken=${nextPageTokenFromState}` : ''
      }`
    );
    const parsedData: HomePageVideos[] = await parseData(items);
    return { parsedData: [...videos, ...parsedData], nextPageToken };
  }
);
