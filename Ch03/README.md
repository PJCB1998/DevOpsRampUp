# The Linux Operating System 

## Goal

## Methodology 

## Handwritten Notes 

## Challenges
1. Display the content of the /etc/passwd, count how many lines it has and sort in a decreasing order (z-a). 

  <p align="center">
    <img style = "width:750px" src="imgs/challenges/ch_01.png">
  </p>
  
2. Find what is your User ID and Group ID. This information is stored in the /etc/passwd file. Also, find what's the line they are. Of course, you should do this without displaying the file's content.
  <p align="center">
    <img style = "width:750px" src="imgs/challenges/ch_02.png">
  </p>
  
3. List files and directories that are hidden on your $pwd. Also, list them by time (use the man page to see what flag you need).  

 <p align="center">
    <img style = "width:750px" src="imgs/challenges/ch_03.png">
 </p>
  
4. Create a file called *myfile*. Update its permissions so only your user can read, write, and execute it.
    <p align="center">
    <img style = "width:750px" src="imgs/challenges/ch_04.png">
    </p>
    
5. Create 5 files (f1,f2,...,f5) without having to type 5 times the touch command.
    <p align="center">
    <img style = "width:750px" src="imgs/challenges/ch_05.png">
  </p>
  
6. Move to another location where those 5 files are not. Then do a search to find them, and execute the *ls -l* command to each of those. This should be done with just one command.

    <p align="center">
    <img style = "width:750px" src="imgs/challenges/ch_06.png">
  </p> 

7. Create the directory d1/d2/d3/foo/d4. If the previous directories don't exist, then they should also be created automatically.

  <p align="center">
    <img style = "width:750px" src="imgs/challenges/ch_07.png">
  </p>
  
8. Given the following text "We have 5 days to finish 5 lines of code of the Hi5b project" Replace all "5" by "five", the number must be alone, cannot be in a word.

  <p align="center">
    <img style = "width:750px" src="imgs/challenges/ch_08.png">
  </p>
  
9. List all processes running on your system and sort them by the username that's running each process

  <p align="center">
    <img style = "width:750px" src="imgs/challenges/ch_09.png">
  </p>
  
10. Run the gedit program, search for it's PID and send it a signal to stop it. After this, send another one resume its execution.

 <p align="center">
    <img style = "width:750px" src="imgs/challenges/ch_10.png">
  </p>
  
11. Install SSH server. Start the service, and check its status. If it is not enabled, do it. 

 <p align="center">
    <img style = "width:750px" src="imgs/challenges/ch_11.png">
  </p>

12. Display the network interfaces on your system. Do you see one that isn't physical? What's that interface?
    
     <p align="center">
    <img style = "width:750px" src="imgs/challenges/ch_12.png">
     </p>
     
13. What's your IP and MAC address?
    
  <p align="center">
    <img style = "width:750px" src="imgs/challenges/ch_13.png">
  </p>
  
14. Can you communicate outside your private network? Test this with a command.
    
  <p align="center">
    <img style = "width:750px" src="imgs/challenges/ch_14.png">
  </p>
  
15. What happens to a packet going to a host outside of the network?
    
    <p align="center">
    <img style = "width:750px" src="imgs/challenges/ch_15.png">
  </p>
  
16. What is the IP of your gateway(s)? Can you check this with two commands?
    
  <p align="center">
    <img style = "width:750px" src="imgs/challenges/ch_16.png">
  </p>
  
17. Trace the route being taken to connect to cloudflare.com.

    <p align="center">
    <img style = "width:750px" src="imgs/challenges/ch_17.png">
  </p>
  
18. What's the IP address of perficient.com? What's their mail server?

<p align="center">
    <img style = "width:750px" src="imgs/challenges/ch_18.png">
  </p>
    
19. List all TCP and UDP connections on the system. 

<p align="center">
    <img style = "width:750px" src="imgs/challenges/ch_19.png">
  </p>

20. What ports do you have open on the system?

<p align="center">
    <img style = "width:750px" src="imgs/challenges/ch_20.png">
  </p>
    
21. List only the listening connections on the system.

    <p align="center">
    <img style = "width:750px" src="imgs/challenges/ch_21.png">
  </p>
