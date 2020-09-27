import React, { Component } from 'react';
import ProductService from '../service/ProductService';

class Products extends Component {

    constructor(props) {
        super(props)
        this.state = {
            products:[]
        }
    }

    componentDidMount() {
        ProductService.getProducts().then((response) => {
            this.setState({ products : response.data });
        });
    }

    render() {
        return (
             <div>
                 <h1 className="text-center">Product</h1>
                 <table className="table table striped">
                     <thead>
                         <tr>
                             <td>ID</td>
                             <td>Name</td>
                             <td>Price</td>
                             <td>Quantity</td>
                             <td>Status</td>
                             <td>Description</td>
                             <td>Brand</td>
                             <td>Category</td>
                         </tr>
                     </thead>
                     <tbody>
                         {
                             this.state.products.map (
                                 product => 
                                 <tr key={ product.id }>
                                     <td> { product.id } </td>
                                     <td> { product.name } </td>
                                     <td> { product.price } </td>
                                     <td> { product.quantity } </td>
                                     <td> { product.status } </td>
                                     <td> { product.description } </td>
                                     <td> { product.brand } </td>
                                     <td> { product.category } </td>
                                 </tr>
                             )
                         }
                     </tbody>
                 </table>
             </div>
        );
    }
}

export default Products