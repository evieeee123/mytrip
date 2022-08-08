import React from "react";
import { MdReviews } from "react-icons/md";
import { Link } from "react-router-dom";
import Map from "../maps/map";
import Rating from "../rating/rating";



class HotelIndex extends React.Component {
    constructor(props) {
        super(props)
    }

    componentDidMount() {
        this.props.fetchHotels(this.props.match.params.cityId)
        this.props.fetchCity(this.props.match.params.cityId)
        // this.props.fetchReview(this.props.match.params.cityId)
    }

    truncate(str, num){
        // debugger
        if (str !== undefined){
            return str.split(" ").splice(0, num).join(" ");
        }else{
            return ""
        }
    }
    
    render() {
        const { hotels, city, reviews } = this.props;
        if (hotels.length === 0 || !city || !reviews) return null;
        console.log("this.props", this.props.reviews)

        // debugger
        return (
            <div className="spot-index-page">
                <div className="spots-index-title">Hotels in {city.name}</div>
                    <div className="spot-index-body">
                    <div className="map">
                            <Map spots={hotels} city={city} clearHotels={this.props.clearHotels} clearRestaurants={this.props.clearRestaurants} clearSpots={this.props.clearSpots} />
                        </div>
                    <ul>
                        {
                            hotels.map(hotel =>

                                <div key={hotel.id} className="single-spot">
                                    <div><img src={window.trip} alt="trip" className="spot-index-img" /></div>
                                    <div className="spot-index-info">
                                        <div className="spot-index-name"><Link to={`/hotels/${hotel.id}`}>{hotel.name}</Link></div>
                                        <div>
                                            <li>{hotel.phonenum}</li>
                                            <li><Rating rate={hotel.rating} /></li>
                                        </div>
                                        
                                        {
                                            (hotel.review[0]) ?
                                                <div><Link to={`/hotels/${hotel.id}`}> "{this.truncate(hotel.review[0], 12)} ..." </Link></div> : ""
                                        }
                                        {
                                            (hotel.review[1]) ?
                                                <div><Link to={`/hotels/${hotel.id}`}> "{this.truncate(hotel.review[1], 12)} ..." </Link> </div> : ""
                                        }
                                        
                                    </div>
                                </div>

                            )
                        }
                    </ul>
                </div>
            </div>
        )
    }

}

export default HotelIndex;