import axios from 'axios';

const PRODUCT_REST_API_URL = 'http://localhost:8080/api/products';

class ProductService {

    getProducts() {
        return axios.get(PRODUCT_REST_API_URL);
    }
}

export default new ProductService();