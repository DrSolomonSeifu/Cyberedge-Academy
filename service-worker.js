// Service Worker for CyberEdge Academy PWA
const CACHE_NAME = 'cysa-portal-v1';
const urlsToCache = [
  'CyberEdge_Master_Portal.html',
  'lesson1_learner_portal.html',
  'lesson2_learner_portal.html',
  'lesson3_learner_portal.html',
  'lesson4_learner_portal.html',
  'lesson5_learner_portal.html',
  'lesson6_learner_portal.html',
  'lesson7_learner_portal.html',
  'lesson8_learner_portal.html',
  'lesson9_learner_portal.html',
  'lesson10_learner_portal.html',
  'lesson11_learner_portal.html',
  'lesson12_learner_portal.html',
  'lesson13_learner_portal.html',
  'lesson14_learner_portal.html',
  'manifest.json'
];

// Install event - cache all resources
self.addEventListener('install', (event) => {
  event.waitUntil(
    caches.open(CACHE_NAME)
      .then((cache) => {
        console.log('Opened cache');
        return cache.addAll(urlsToCache);
      })
  );
});

// Fetch event - serve from cache, fallback to network
self.addEventListener('fetch', (event) => {
  event.respondWith(
    caches.match(event.request)
      .then((response) => {
        // Cache hit - return response
        if (response) {
          return response;
        }
        
        // Clone the request
        const fetchRequest = event.request.clone();
        
        return fetch(fetchRequest).then((response) => {
          // Check if valid response
          if (!response || response.status !== 200 || response.type !== 'basic') {
            return response;
          }
          
          // Clone the response
          const responseToCache = response.clone();
          
          caches.open(CACHE_NAME)
            .then((cache) => {
              cache.put(event.request, responseToCache);
            });
          
          return response;
        });
      })
  );
});

// Activate event - clean up old caches
self.addEventListener('activate', (event) => {
  const cacheWhitelist = [CACHE_NAME];
  
  event.waitUntil(
    caches.keys().then((cacheNames) => {
      return Promise.all(
        cacheNames.map((cacheName) => {
          if (cacheWhitelist.indexOf(cacheName) === -1) {
            return caches.delete(cacheName);
          }
        })
      );
    })
  );
});
