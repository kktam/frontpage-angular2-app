require('replace')({
  regex: "\<app-post-upvoter[^\>]*\>(.*)*<\/app-post-upvoter\>",
  replacement: "",
  paths: ['./src/app/post/post-list.component.ts'],
  silent: true
});
