import { InitialState } from '@/Types';
import { configureStore, createSlice, PayloadAction } from '@reduxjs/toolkit';
import { getHomePageVideos } from './reducers/getHomePageVideos';
import { getRecommendedVideos } from './reducers/getRecommendedVideos';
import { getSearchPageVideos } from './reducers/getSearchPageVideos';
import { getVideoDetails } from './reducers/getVideoDetails';

const initialState: InitialState = {
  videos: [],
  currentPlaying: null,
  searchTerm: '',
  searchResults: [],
  nextPageToken: null,
  recommendedVideos: [],
};


const YouTubeSlice = createSlice({
  name: 'youtubeApp',
  initialState,
  reducers: {
    clearVideos: (state) => {
      state.videos = [];
      state.nextPageToken = null;
    },
    changeSearchTerm: (state, action: PayloadAction<string>) => {
      state.searchTerm = action.payload;
    },
    clearSearchTerm: (state) => {
      state.searchTerm = '';
    },
  },
  extraReducers: (builder) => {
    builder
      .addCase(getHomePageVideos.fulfilled, (state, action) => {
        state.videos = action.payload.parsedData;
        state.nextPageToken = action.payload.nextPageToken;
      })
      .addCase(getSearchPageVideos.fulfilled, (state, action) => {
        state.videos = action.payload.parsedData;
        state.nextPageToken = action.payload.nextPageToken;
      })
      .addCase(getVideoDetails.fulfilled, (state, action) => {
        state.currentPlaying = action.payload;
      })
      .addCase(getRecommendedVideos.fulfilled, (state, action) => {
        state.recommendedVideos = action.payload.parsedData;
      });
  },
});

export const { clearVideos, changeSearchTerm, clearSearchTerm } =
  YouTubeSlice.actions;

export const store = configureStore({
  reducer: {
    youtubeApp: YouTubeSlice.reducer,
  },
});

export type RootState = ReturnType<typeof store.getState>;
export type AppDispatch = typeof store.dispatch;
