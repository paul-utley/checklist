import React from 'react'

class ListItem extends React.Component{

    constructor(props){
        super(props);
        this.state={id:this.props.id};
    }

    render(){
        return (<li id={this.props.id}>
                {this.props.label}
                <button onClick={(e) => this.props.onDelete(this.state.id, e) }>
                    Delete
                </button>
                <button>
                    Complete
                </button>
            </li>);
    }
}

export default ListItem;