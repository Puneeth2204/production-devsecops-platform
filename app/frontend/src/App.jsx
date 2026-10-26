import { useEffect, useState } from 'react'
import './App.css'

const API_URL = '/api'

function App() {
  const [health, setHealth] = useState('Checking...')
  const [patients, setPatients] = useState([])
  const [message, setMessage] = useState('Loading...')
  const [error, setError] = useState('')

  useEffect(() => {
    async function loadDashboard() {
      try {
        const [healthResponse, patientsResponse] = await Promise.all([
          fetch(`${API_URL}/health`),
          fetch(`${API_URL}/patients`),
        ])

        if (!healthResponse.ok || !patientsResponse.ok) {
          throw new Error('The backend returned an unsuccessful response.')
        }

        const healthData = await healthResponse.json()
        const patientsData = await patientsResponse.json()

        setHealth(healthData.status ?? 'Available')
        setPatients(patientsData.patients ?? [])
        setMessage(patientsData.message ?? 'Hospital Management API is running')
      } catch {
        setError('Unable to connect to the backend. Check that it is running on port 8080.')
      }
    }

    loadDashboard()
  }, [])

  return (
    <main className="dashboard">
      <header className="header">
        <div>
          <p className="eyebrow">HOSPITAL MANAGEMENT PLATFORM</p>
          <h1>Hospital Operations</h1>
          <p className="subtitle">Application and service health overview</p>
        </div>
        <span className={`status ${health === 'UP' ? 'online' : ''}`}>
          {health === 'UP' ? '● API Online' : health}
        </span>
      </header>

      {error && <p className="error">{error}</p>}

      <section className="cards">
        <article className="card">
          <p className="card-label">Backend API</p>
          <h2>{health}</h2>
          <p>Spring Boot · Port 8080</p>
        </article>

        <article className="card">
          <p className="card-label">Registered patients</p>
          <h2>{patients.length}</h2>
          <p>Patients returned by the API</p>
        </article>

        <article className="card">
          <p className="card-label">Service message</p>
          <h2 className="message">{message}</h2>
          <p>Live response from the backend</p>
        </article>
      </section>

      <footer>DevSecOps Platform · Development Environment</footer>
    </main>
  )
}

export default App