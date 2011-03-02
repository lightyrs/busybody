busybody
=============
busybody is a rubygem that fetches the primary twitter and facebook urls from any website.  
As of the initial commit, it has a very high success rate (~85%), however, I will be updating this project on an ongoing basis with various speed and relevance improvements.

Usage
-------------
**busybody depends on nokogiri and httparty**

There is only one method, "pry", which takes two required parameters, the site name and url.  
The site name is used to detect the relevancy of a social url when there are multiple urls present.
 
	BusyBody.pry(name,url)
		
This will return a hash:

	{
	  "twitter"  => "http://twitter.com/michaeljackson",
	  "facebook" => "http://www.facebook.com/michaeljackson"
	}