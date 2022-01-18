
const fetch = require('node-fetch')

const stardogUser = process.env.SOURCE_ENDPOINT_USER
const stardogPassword = process.env.SOURCE_ENDPOINT_PASSWORD
const database = process.env.SOURCE_ENDPOINT_DATABASE


const metadata = `
INSERT  { GRAPH <https://ld.staatsarchiv.bs.ch/graph/source> {
  <http://data.staatsarchiv-bs.ch/dataset/Archivkatalog> <http://purl.org/dc/terms/modified> ?modified .
}}  WHERE {
  BIND( NOW() as ?modified)
}
`

function checkStatus (res) {
  if (res.ok) { // res.status >= 200 && res.status < 300
    console.log(`Request successfully executed, got ${res.status}: ${res.statusText}`)
    return res
  } else {
    console.log(`Could not execute request, got ${res.status}: ${res.statusText}`)
  }
}

// According to UPDATE spec: The COPY operation is a shortcut for inserting all data from an input graph into a destination graph. Data from the input graph is not affected, but data from the destination graph, if any, is removed before insertion.
fetch(`http://${stardogUser}:${stardogPassword}@pdstasvogdp:8081/${database}/update?query=COPY <virtual://scope-virtual> TO <https://ld.staatsarchiv.bs.ch/graph/source>`)
  .then(checkStatus)
  .then(() => fetch(`http://${stardogUser}:${stardogPassword}@pdstasvogdp:8081/${database}/update?query=${metadata}`))
  .then(checkStatus)
  .catch((err) => console.error(err))
