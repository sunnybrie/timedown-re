import "./App.css";
import NavBar from "./components/nav-bar";
import Calendar from "./calendar/Calendar.js";
import Profile from "./components/profile";
import { useAuth0 } from '@auth0/auth0-react';
import Loading from "./components/loading";
import { Route, Routes, Link } from 'react-router-dom';

function App() {

  const { isLoading } = useAuth0();
  const { user } = useAuth0();
  if (isLoading) {
    return <Loading />;
  }

  return (
    <div id="app" className="d-flex flex-column h-100">
      <NavBar />
      <div className="container flex-grow-1">
      {!user ? <span>Hello from Techtonica From DEV!!!</span> : <span>Hello <Link to="api/me">{user.name}</Link></span> }
      <Calendar />
      <Routes>
      <Route path="api/me" element={<Profile user={user}/>} />
      </Routes>
      </div>
    </div>
  );
}

export default App;
