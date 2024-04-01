#!/usr/bin/env node

// cli.js
// JOB    : creates date-based knowledge base identifier
// GIT    : https://github.com/dofufa/dofufa-kbdate-node
// LIC    : MIT

// expecting input for Date.parse
let input = process.argv.slice(2).join(' ').trim();

// right now, by default
const now = new Date();

const re = /\d{1,2}:\d{2}$/;

let dt = null;
let indate = null;

if (!!input) {

  if(!re.test(input)) {
    input += ' 00:00';
  }

  // the parsed input date
  indate = Date.parse(input);

  if(isNaN(indate)) {
    stop(`invalid input date: "${input}"`);
  }

  dt = new Date(indate);
}

const d = dt || now;
const yyyy = d.getFullYear();

if(yyyy < 1970 || yyyy > 2050) {
  stop(`invalid input year: "${input}"`);
}

// first day of the new year
const newyear = new Date(Date.parse(yyyy + '-01-01 00:00'));

// one day in [[milliseconds]]
const oneday = 3600 * 24 * 1000;
const diff = d.getTime() - newyear.getTime();
const days = Math.floor(diff / oneday);

// kbdate parts
const yy = yyyy.toString().substring(2);
const nnn = days.toString().padStart(3,0)
const hh = d.getHours().toString().padStart(2,0);
const mm = d.getMinutes().toString().padStart(2,0);

const kbdate = `KB${yy}${nnn}${hh}${mm}`;
console.log(kbdate);

function stop(str) {
    console.error(str);
    process.exit(1);
}
