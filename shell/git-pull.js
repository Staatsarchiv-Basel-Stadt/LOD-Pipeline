// this repo should live in the docker container
const gitRepo = '/Users/ktk/tmp/automation-test-repo'
// const gitRepo = '/Users/ktk/workspace/zazuko/StABS-scope2RDF'
const fetch = require('node-fetch')

const simpleGit = require('simple-git')(gitRepo)

// configuration
const stardogHome = 'opt/stardog'
const stardogMappingDir = 'opt/stardog-scope'
const mappingSource = 'src-gen/stabs-mapping.r2rml.ttl'
const mappingDest = 'stabs-mapping.r2rml.ttl'
const propertiesSource = `${process.cwd()}/credentials/scope-virtual.properties`
const propertiesDest = 'scope-virtual.properties'
const stardogUser = 'admin'
const stardogPassword = 'admin'
const stardogEndpoint = 'localhost'
const stardogPort = '5820'
const stardogDb = 'test'
const stardogJava = `cd ${stardogMappingDir} && java -Doracle.jdbc.Trace=true -Dstardog.home=${stardogHome} -XX:SoftRefLRUPolicyMSPerMB=1 -XX:+UseParallelOldGC -XX:+UseCompressedOops -Djavax.xml.datatype.DatatypeFactory=org.apache.xerces.jaxp.datatype.DatatypeFactoryImpl -Dapple.awt.UIElement=true -Dfile.encoding=UTF-8 -Dlog4j.configurationFile=/opt/stardog/bin/../server/dbms/log4j2.xml -Dstardog.install.location=/opt/stardog/bin/.. -server -classpath '/opt/stardog/bin/../client/ext/*:/opt/stardog/bin/../client/api/*:/opt/stardog/bin/../client/cli/*:/opt/stardog/bin/../client/http/*:/opt/stardog/bin/../client/snarl/*:/opt/stardog/bin/../client/pack/*:/opt/stardog/bin/../server/ext/*:/opt/stardog/bin/../server/dbms/*:/opt/stardog/bin/../server/http/*:/opt/stardog/bin/../server/snarl/*:/opt/stardog/bin/../server/pack/*:/*' com.complexible.stardog.cli.admin.CLI'`
const stardogOracleAdd = `${stardogJava} virtual add --format r2rml ${propertiesDest} ${mappingDest}`
const stardogOracleRemove = `${stardogJava} virtual remove scope-virtual`
const stardogOracleMaterialize = `${stardogJava} virtual import  --format r2rml scope ${propertiesDest} ${mappingDest}`

const shell = require('shelljs')

simpleGit.exec(() => console.log('Starting pull...'))
  .pull((_err, update) => {
    if (update && update.summary.changes) {
      //      require('child_process').exec('echo bla')
      console.log('Repository was updated')
    } else {
      console.log('No change in repository')

      gitUpdate()
    }
  })
  .exec(async () => {
    await fetch(`http://${stardogUser}:${stardogPassword}@${stardogEndpoint}:${stardogPort}/${stardogDb}/update?query=CLEAR default`)
      .then(checkStatus)
    console.log('pull done.')
  })

function gitUpdate () {
  // move all this to if update
  shell.exec(`ssh stardog-bs 'mkdir -p ${stardogMappingDir}'`)

  shell.echo('Copying SCOPE mapping files...')
  if (shell.exec(`scp ${gitRepo}/${mappingSource} stardog-bs:${stardogMappingDir}`).code !== 0) {
    shell.echo('Error: Copying R2RML mapping failed')
    shell.exit(1)
  } else if (shell.exec(`scp ${propertiesSource} stardog-bs:${stardogMappingDir}/${propertiesDest}`).code !== 0) {
    shell.echo('Error: Copying Oracle properties file failed')
    shell.exit(1)
  } else {
    //shell.exec(`ssh stardog-bs '${stardogOracleRemove}'`)
    shell.echo(stardogOracleRemove)
    shell.echo(stardogOracleAdd)
  }
}

function checkStatus (res) {
  if (res.ok) { // res.status >= 200 && res.status < 300
    console.log('Successfully cleared graph')
    return res
  } else {
    console.log(`Could not clear graph, got ${res.status}: ${res.statusText}`)
  }
}

