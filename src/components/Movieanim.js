import React, { useEffect, useState } from 'react'
import Movie from './Movie';

const Movieanim = () => {
    const [popular,setPopular]=useState([]);
    useEffect(()=>{
fetchpopular();
},[]);
async function fetchpopular(){
    const data=await fetch("https://api.themoviedb.org/3/movie/popular?api_key=335c7bfbb6b995d1c05eaf30942069e4&language=en-US&page=1");
    // const data=await fetch("https://api.themoviedb.org/3/movie/9?api_key=335c7bfbb6b995d1c05eaf30942069e4&language=en-US");
    const movies=await data.json();
    setPopular(movies.results);
    // console.log(movies.results)
    
    };
  return (
    <div className="popular">
        {popular.map((movie)=>{
     return <Movie key={movie.id} movie={movie}/>
        // <div>{movie}</div>
        // <div>{movie}</div>
        // <div>{movie}</div>
        // <div>{movie}</div>
        // <div>{movie}</div>
        // <div>{movie}</div>
        // <div>{movie}</div>
        // <div>{movie}</div>
    })}
    </div>
  )
}

export default Movieanim