
# spreedly_airlines

A project to experience the Spreedly API from the customer's perspective. View my 'live' site here: [Spreedly Airlines](https://molly-airlines.herokuapp.com/)

Notes on my experience:

- I had the hardest time understanding how to fold PMD into my app. The "receiver" is not as intuitive as a gateway, but having the "Expedia" example helps to get a comparitive context.
- I needed to ask/ research about PCI-compliant storage of data associated with my transactions. Besides avoiding actual card information, how secure is a payment method token? 
- Personally, it took me the most time to wrestle with (1) the js around Express and (2) building the purchase/ deliver requests correctly, but that is mostly due to me not having too much previous experince with this. Looking at the examples in the docs very much cleared things up there.
- I found the documentation to take me through a series of link-to-link-to-link, and quickly ended up with 8+ tabs open. In spending time with them, I got better at re-navigating through them to what I needed to reference, but it got really big right at the beginning and a little confusing, especially before I had a plan for organizing Express vs. gateway vs. PMD in the context of my app. Maybe an outline somewhere of that documentation structure would help an early-stage reader keep their footing? That might just be my personal preference... 
