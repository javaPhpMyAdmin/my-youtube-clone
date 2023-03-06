import { Card, NavBar, SlideBar, Spinner } from '@/components';
import { clearVideos } from '@/redux';
import { useAppDispatch, useAppSelector } from '@/redux/hooks';
import { getHomePageVideos } from '@/redux/reducers/getHomePageVideos';
import { HomePageVideos } from '@/Types';
import { useEffect } from 'react';
import InfiniteScroll from 'react-infinite-scroll-component';

export default function Home() {
  const dispatch = useAppDispatch();
  const videos = useAppSelector((state) => state.youtubeApp.videos);

  useEffect(() => {
    return () => {
      dispatch(clearVideos());
    };
  }, [dispatch]);

  useEffect(() => {
    dispatch(getHomePageVideos(false));
  }, [dispatch]);

  return (
    <div className="max-h-screen overflow-hidden">
      <div style={{ height: '7.5vh' }}>
        <NavBar />
      </div>
      <div className="flex" style={{ height: '92.5vh' }}>
        <SlideBar />
        {videos.length ? (
          <InfiniteScroll
            dataLength={videos.length}
            next={() => dispatch(getHomePageVideos(true))}
            hasMore={videos.length < 500}
            loader={<Spinner />}
            height={1050}
          >
            <div className="grid gap-y-14 gap-x-8 lg:grid-cols-4 p-8 md:grid-cols-2 sm:grid-cols-1">
              {videos.map((item: HomePageVideos) => {
                return <Card data={item} key={item.videoId} />;
              })}
            </div>
          </InfiniteScroll>
        ) : (
          <Spinner />
        )}
      </div>
    </div>
  );
}
