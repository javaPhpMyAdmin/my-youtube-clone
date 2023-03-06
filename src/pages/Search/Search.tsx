import { NavBar, SearchCard, SlideBar, Spinner } from '@/components';
import { clearVideos } from '@/redux';
import { useAppDispatch, useAppSelector } from '@/redux/hooks';
import { getSearchPageVideos } from '@/redux/reducers/getSearchPageVideos';
import { HomePageVideos } from '@/Types';
import { useEffect } from 'react';
import InfiniteScroll from 'react-infinite-scroll-component';
import { useNavigate } from 'react-router-dom';

export default function Search() {
  const navigate = useNavigate();
  const dispatch = useAppDispatch();
  const videos = useAppSelector((state) => state.youtubeApp.videos);
  const searchTerm = useAppSelector((state) => state.youtubeApp.searchTerm);

  useEffect(() => {
    dispatch(clearVideos());
    if (searchTerm === '') navigate('/');
    else dispatch(getSearchPageVideos(false));
  }, [dispatch, navigate, searchTerm]);

  return (
    <div className="max-h-screen overflow-hidden">
      <div style={{ height: '7.5vh' }}>
        <NavBar />
      </div>
      <div className="flex" style={{ height: '92.5vh' }}>
        <SlideBar />
        {videos.length ? (
          <div className="py-8 pl-8 flex flex-col gap-5 w-full">
            <InfiniteScroll
              dataLength={videos.length}
              next={() => dispatch(getSearchPageVideos(true))}
              hasMore={videos.length < 500}
              loader={<Spinner />}
              height={600}
            >
              {videos.map((item: HomePageVideos) => {
                return (
                  <div key={item.videoId} className="my-5">
                    <SearchCard data={item} key={item.videoId} />
                  </div>
                );
              })}
            </InfiniteScroll>
          </div>
        ) : (
          <Spinner />
        )}
      </div>
    </div>
  );
}
