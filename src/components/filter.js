import React, { useEffect } from 'react'
// setFiltered={setFiltered} setActiveId={setActiveId} activeId={activeId} popular={popular}
function Filter  ({setFiltered,setActiveId,activeId,popular}){
  useEffect(()=>{
    // if(activeId === 0){
    // setFiltered(popular);
    // return;
    // }
  const filtera=popular.filter((filt)=>{
    filt.genre_ids.includes(activeId);
    // console.log(filt.genre_ids);
  });
  return setFiltered(filtera); 
  },[activeId]);
  // console.log(activeId)
  return (
    <div className="filterContainer">
      <button className={activeId === 0 ? 'active' : ""} onClick={()=>setActiveId(0)}>All</button>  
      <button className={activeId === 35 ? 'active' : ""} onClick={()=>setActiveId(35)}>Comedy</button>  
      <button className={activeId === 28 ? 'active' : ""} onClick={()=>setActiveId(28)}>Action</button>  
    </div>
  )
}
export default Filter