import React from 'react'

class CreateForm extends React.Component{

    constructor(props){
        super(props);
        this.state = {value:'', show: false};
    }

    handleSubmit(event){
        this.props.submit(this.state.value);
        this.setState({value: ''})
        this.setState({show:false});
        event.preventDefault();
    }

    handleChange(event){
        this.setState({value: event.target.value});
    }

    handleShow(event){
        this.setState({show:true});
    }

    render(){
        if(this.state.show){
            return (
                <form onSubmit={(e) => this.handleSubmit(e)}>
                    <input type="text" placeholder="Ex: Brush Teeth" value={this.state.value} onChange={(e) => this.handleChange(e)} />    
                </form>
            );
        }else{
            return (<button onClick={(e) => this.handleShow(e)}>New Item</button>)
        }
        
    }
}

export default CreateForm;