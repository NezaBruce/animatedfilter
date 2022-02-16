import React, { useEffect, useState } from 'react'
import Movie from './Movie';
import Filter from './Filter';
const Movieanim = () => {
  const [filtered,setFiltered]=useState([]);
  const [activeId,setActiveId]=useState(0);
  const [popular,setPopular]=useState([]);

    useEffect(()=>{
    fetchpopular();
    },[]);
async function fetchpopular(){
    const data=await fetch("https://api.themoviedb.org/3/movie/popular?api_key=335c7bfbb6b995d1c05eaf30942069e4&language=en-US&page=1");
    // const data=await fetch("https://api.themoviedb.org/3/movie/9?api_key=335c7bfbb6b995d1c05eaf30942069e4&language=en-US");
    const movies=await data.json();
    setPopular(movies.results);
    setFiltered(movies.results);
    // console.log(movies.results)
    // <Filter setFiltered={setFiltered} setActiveId={setActiveId} filtered={setfiltered}/>
  };
  return (
    <div className="popular">
      <Filter setFiltered={setFiltered} setActiveId={setActiveId} activeId={activeId} popular={popular}/>
        {filtered.map((movie)=>{
          return <Movie key={movie.id} movie={movie}/>
        })}
    </div>
  )
}
export default Movieanim