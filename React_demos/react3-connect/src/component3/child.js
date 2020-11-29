import React from "react";
import SubSub from "./son";

const Sub = (props) =>{
    return(
        <div>
            <h1>Im is Child</h1>
            <SubSub />
        </div>
    );
}

export default Sub;