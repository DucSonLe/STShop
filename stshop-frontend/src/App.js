import React from 'react';
import './App.css';
import Navbar from './components/Navbar';
import { Route, Switch, BrowserRouter } from 'react-router-dom';
import Products from './content/Products';

function App() {
  return (
    <BrowserRouter>
      <Navbar />
      <Switch>
        <Route path='/' exact />
        <Route path='/products'>
            <Products />
        </Route>
    </Switch>
    </BrowserRouter>
  );
}

export default App;
