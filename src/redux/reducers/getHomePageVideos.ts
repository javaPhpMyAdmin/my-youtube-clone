import { createAsyncThunk } from '@reduxjs/toolkit';
import { RootState } from '..';
import axios from 'axios';
import { parseData, YOUTUBE_API_URL } from '@/utils';
import { HomePageVideos } from '@/Types';

const API_KEY = import.meta.env.VITE_YOUTUBE_APIKEY;

export const getHomePageVideos = createAsyncThunk(
  'youtubeApp/homePageVideos',
  async (isNext: boolean, { getState }) => {
    const {
      youtubeApp: { nextPageToken: nextPageTokenFromState, videos },
    } = getState() as RootState;
    const {
      data: { items, nextPageToken },
    } = await axios.get(
      `${YOUTUBE_API_URL}/search?maxResults=20&q='react projects'&key=${API_KEY}&part=snippet&type=video&${
        isNext ? `pageToken=${nextPageTokenFromState}` : ''
      }`
    );
    const parsedData: HomePageVideos[] = await parseData(items);
    return { parsedData: [...videos, ...parsedData], nextPageToken };
  }
);
