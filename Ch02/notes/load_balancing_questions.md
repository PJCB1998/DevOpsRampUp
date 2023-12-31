
# 1. What's the difference between a L4 and L7 load balancer? Can you give an example?

L4 load balancers work at the transport layer (layer 4) of the OSI model. They make routing decisions based on the source and destination IP addresses and ports of the incoming traffic. For example, an L4 load balancer could be used to distribute traffic between web servers based on the client's IP address.  

L7 load balancers work at the application layer (layer 7) of the OSI model. They make routing decisions based on the content of the HTTP requests. For example, an L7 load balancer could be used to distribute traffic between web servers based on the URL of the request.  

Here is an example of how an L4 load balancer and an L7 load balancer might be used together:
* An L4 load balancer could be used to distribute traffic between two web servers. The L4 load balancer would make routing decisions based on the client's IP address.  
* An L7 load balancer could be used to distribute traffic between the two web servers based on the URL of the request. For example, the L7 load balancer could send all requests for the /products page to one web server, and all requests for the /contact page to the other web server.  

# 2. In which cases would you use a L7 load balancer?

You would use a L7 load balancer in cases where you need to make routing decisions based on the content of the HTTP requests. For example, you might use a L7 load balancer to distribute traffic between web servers based on the URL of the request, the user's location, or the content of the shopping cart.  

# 3. What are the benefits of a load balancer?

There are many benefits to using a load balancer, including:

* Improved performance: A load balancer can distribute traffic across multiple servers, which can improve performance by reducing the load on any individual server.  
* Increased availability: A load balancer can help to ensure that your applications are available even if one or more servers fail.  
* Improved scalability: A load balancer can help you to scale your applications as your traffic grows.  
* Reduced complexity: A load balancer can help to simplify the management of your applications by centralizing traffic management.  

# 4. Describe a situation where a proxy isn't a load balancer and what would be its use.

* A proxy is a server that acts as an intermediary between a client and a server. It can be used to improve performance, security, or both.  
* A proxy is not a load balancer if it does not distribute traffic across multiple servers. For example, a proxy that is used to cache web pages is not a load balancer. This is because the proxy is simply serving the same web pages from a single server, rather than distributing traffic across multiple servers.  
* A proxy can be used to improve performance by caching web pages. When a client requests a web page, the proxy will first check its cache to see if it has a copy of the page. If it does, the proxy will serve the page from its cache, which will improve performance because the client does not have to download the page from the original server.  
* A proxy can also be used to improve security by filtering traffic. For example, a proxy can be used to block malicious traffic from reaching a server.  
