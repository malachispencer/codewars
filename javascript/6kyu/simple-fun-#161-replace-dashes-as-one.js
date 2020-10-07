/*
Codewars. 20/08/20. 'Simple Fun #161: Replace Dashes As One'. 6kyu. Here we create a function which takes a string and replaces all
consecutive dashes (--) with one dash (-). Dashes are considered consecutive even if there is some whitespace between them. For example,
'we-are- - - code----warriors.-' should return 'we-are- code-warriors.-'. Here is the solution I developed to solve the challenge.
1) We call the replace method on the string.
2) In our regex, we match a dash, followed by 0 or more dashes or spaces, followed by another dash. Obviously, at the bare minimum, 
   consecutive dashes must contain 2 dashes, but we can also have zero or more spaces or dashes in between, thus our regex matches this.
   Use of the 'g' pattern modifier makes our match global.
3) We replace our pattern match with a single dash.
4) We return the string with consecutive dashes removed.
*/

function replaceDashesAsOneMS(str) {
  return str.replace(/\-[\s\-]*\-/g, '-');
}

/*
Here is the same solution shortened slightly, as we can see, there was no need for for backslash to escape the dashes.
*/

function replaceDashesAsOne(str) {
  return str.replace(/-[- ]*-/g, '-');
}