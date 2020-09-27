import React from 'react';
import { Link } from 'react-router-dom';
import './Navbar.css';

function Navbar() {
    return (
        <>
            <nav className='navbar'>
                <div className='navbar-container'>
                    <Link to='/' className='navbar-title'>
                        ST Shop
                    </Link>
                    <Link to='/' className='navbar-item'>
                        Home
                    </Link>
                    <Link to='/products' className='navbar-item'>
                        Product
                    </Link>
                    <div className="navbar-search-box">
                        <input type="text" className="search-box" placeholder="Search"/>
                        <i className="far fa-search" />
                    </div>
                    
                    <div className='cart-icon'>
                        <Link to='/cart'>
                            <i className="fas fa-shopping-cart"></i>
                        </Link>
                    </div>
                </div>
            </nav> 
        </>
    )
}

export default Navbar;
