import React from 'react'

class ListItem extends React.Component{
    render(){
        return (<li>{this.props.label}</li>);
    }
}

export default ListItem;