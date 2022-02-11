import React from 'react'

const Movie = ({movie}) => {
  return (
    <div>
      <h3>{movie.title}</h3>
            <img src={"https:/image.tmdb.org/t/p/w500" + movie.backdrop_path}/>
        </div>
  )
}

export default Movie