all:	cloudfront-directory-index.zip

cloudfront-directory-index.zip: index.js
	zip cloudfront-directory-index.zip index.js
