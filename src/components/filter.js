import React, { useEffect } from 'react'

const filter = ({setFiltered,setActiveId,activeId,popular}) => {
  // setFiltered={setFiltered} setActiveId={setActiveId} activeId={activeId} popular={popular}
  useEffect(()=>{
if(activeId === 0){
  setFiltered(popular);
  return;
}
const filtera=popular.filter((filt)=>{
  filt.genre_ids.include(activeId)
});
setFiltered(filtera); 
},[activeId]);
  return (
    <div className="filter">
    </div>
  )
}

export default filter