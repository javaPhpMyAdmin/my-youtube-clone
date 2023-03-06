import { AiOutlineSearch, AiOutlineClose } from 'react-icons/ai';
import { TiMicrophone } from 'react-icons/ti';
import { BsYoutube, BsCameraVideo, BsBell } from 'react-icons/bs';
import { GiHamburgerMenu } from 'react-icons/gi';
import { IoAppsSharp } from 'react-icons/io5';
import { Link, useLocation, useNavigate } from 'react-router-dom';
import { useAppDispatch, useAppSelector } from '@/redux/hooks';
import { changeSearchTerm, clearSearchTerm, clearVideos } from '@/redux';
import React from 'react';
import { getSearchPageVideos } from '@/redux/reducers/getSearchPageVideos';

export default function NavBar() {
  const location = useLocation();
  const navigate = useNavigate();
  const dispatch = useAppDispatch();
  const searchTerm = useAppSelector((state) => state.youtubeApp.searchTerm);

  const handleSearch = () => {
    if (location.pathname !== '/search') navigate('/search');
    else {
      dispatch(clearVideos());
      dispatch(getSearchPageVideos(false));
    }
  };

  const handleSubmit = (event: React.FormEvent<HTMLFormElement>) => {
    event.preventDefault();
    handleSearch();
  };

  const handleChange = (event: React.ChangeEvent<HTMLInputElement>) => {
    dispatch(changeSearchTerm(event.target.value));
  };

  const handleCloseSearch = () => {
    dispatch(clearSearchTerm());
  };

  return (
    <div className="flex justify-between items-center px-14 h-14 bg-[#212121] opacity-95 sticky top-0 z-50 md:px-9 sm:px-5">
      <div className="flex gap-8 items-center text-2xl md:gap-5 sm:gap-3">
        <div>
          <GiHamburgerMenu />
        </div>
        <Link to="/">
          <div className="flex gap-1 items-center justify-content">
            <BsYoutube className="text-3xl text-red-600" />
            <span className="text-xl font-medium">YouTube</span>
          </div>
        </Link>
      </div>
      <div className="flex items-center justify-center gap-5">
        <form action="" onSubmit={handleSubmit}>
          <div className="flex bg-zinc-900 items-center h-10 px-4 pr-0">
            <div className="flex xl:gap-4 lg:gap-3 items-center pr-5 md:gap-2 sm:gap-1">
              <div>
                <AiOutlineSearch className="text-xl" />
              </div>
              <input
                type="text"
                className="xl:w-96 lg:w-86 md:w-60 sm:w-30 bg-zinc-900 focus:outline-none border-none"
                value={searchTerm}
                onChange={handleChange}
              />
              <AiOutlineClose
                className={`text-xl cursor-pointer ${
                  !searchTerm ? 'invisible' : 'visible'
                }`}
                onClick={handleCloseSearch}
              />
            </div>
            <button className="h-10 w-16 flex items-center justify-center bg-zinc-800">
              <AiOutlineSearch className="text-xl" />
            </button>
          </div>
        </form>
        <div className="text-xl p-3 bg-zinc-900 rounded-full">
          <TiMicrophone />
        </div>
      </div>
      <div className="flex gap-5 items-center text-xl">
        <BsCameraVideo />
        <IoAppsSharp />
        <div className="relative">
          <BsBell />
          <span className="absolute bottom-2 left-2 text-xs bg-red-600 rounded-full px-1">
            9+
          </span>
        </div>
        <img className="w-9 h-9 rounded" src={''} alt="" />
      </div>
    </div>
  );
}
