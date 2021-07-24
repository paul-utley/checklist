import React from 'react'
import ListItem from './ListItem'

class App extends React.Component {

    columns = [{
        title: "Label",
        dataIndex: "label",
        key: "label"
    }];

    constructor(props){
        super(props);
        this.state = {items:[]};
        this.refresh();
    }
    render(){
        console.log(this.state);
        let listItems = this.state.items.map((item) =>
            <ListItem key={item.id} label={item.label} />
        );

        return (
            <>
            <h1>My Daily List</h1>
            <ul>{listItems}</ul>
            </>
        );
    }

    refresh(){
        fetch('api/v1/list-item').then(response => response.json()).then(data => this.setState({items: data}));
    }
}

export default App;