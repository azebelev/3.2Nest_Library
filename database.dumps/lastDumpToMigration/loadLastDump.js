const fs = require('fs')
const path = require('path')

const files = fs.readdirSync(path.join(__dirname, '..', 'dumps'))
const lastDumpName = files[files.length - 1]

const loadMigrationFileName = fs.readdirSync(path.join(__dirname, '..', '..', 'migrations', 'sqls'))
	.filter(fileName => /\S+loadDump-up.sql/g.test(fileName))[0]
fs.copyFileSync(path.join(__dirname, '..', 'dumps', lastDumpName), path.join(__dirname, '..', '..', 'migrations', 'sqls', loadMigrationFileName))

console.log('updated file : ', loadMigrationFileName)



