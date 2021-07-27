import React from 'react'
import ListItem from './ListItem'
import CreateForm from './CreateForm'

const baseUrl = 'api/v1/';

class App extends React.Component {

    constructor(props){
        super(props);
        this.state = {
            items:[],
            error: '',
            csrfParam: document.getElementsByName("csrf-param")[0].content,
            csrfToken: document.getElementsByName("csrf-token")[0].content
        };
    }

    componentDidMount(){
        this.refreshList();
    }

    render(){
        console.log(this.state);
        let listItems = this.state.items.map((item) =>
            <ListItem key={item.id} id={item.id} label={item.label} onDelete={(e) => this.deleteItem(e)}/>
        );

        return (
            <>
            <h1>My Daily List</h1>
            <ul>{listItems}</ul>
            <CreateForm submit={(e) => this.createItem(e)} />
            <p>{this.state.error}</p>
            </>
        );
    }

    refreshList(){
        fetch(baseUrl + 'list-item')
            .then(response => response.json())
            .then((data) => {
                this.setState({items: data || []})
            });
    }

    createItem(label){
        fetch(baseUrl + `list-item`,{
            method: "post",
            headers: {
                "Content-Type": "application/json",
                "X-CSRF-Token": this.state.csrfToken
            },
            body: JSON.stringify({ 
                "label": label,
                "group": "morning"
            })
        }).then((data) => {
            console.log(data);
            if(data.ok){
                //Hide the box here
                //return the data
                return data.json();
            }
            throw new Error("Network Error. " . data);
        }).then(() => {
            this.refreshList();
        }).catch((err) => this.setState({error: err}));
    }

    deleteItem(id){
        fetch(baseUrl + `list-item/${id}`, {
            method: "delete",
            headers: {
                "X-CSRF-Token": this.state.csrfToken
            },
        })
        .then((data) => {
            if(data.ok){
                this.refreshList();
                return data.json();
            }
            throw new Error("Network Error.");
        })
        .catch((err) => console.error("Error: " + err));
    }

    completeItem(id){

    }
}

export default App;