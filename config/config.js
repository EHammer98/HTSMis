/* Magic Mirror Config Sample
 *
 * By Michael Teeuw http://michaelteeuw.nl
 * MIT Licensed.
 *
 * For more information on how you can configure this file
 * See https://github.com/MichMich/MagicMirror#configuration
 *
 */

var config = {
        //address: "localhost", // Address to listen on, can be:
        address: "0.0.0.0",
                              // - "localhost", "127.0.0.1", "::1" to listen on loopback interface
                              // - another specific IPv4/6 to listen on a specific interface
                              // - "0.0.0.0", "::" to listen on any interface
                              // Default, when address config is left out or empty, is "localhost"
        port: 8080,
        //ipWhitelist: ["127.0.0.1", "::ffff:127.0.0.1", "::1"], // Set [] to allow all IP addresses
        ipWhitelist: [], // Set [] to allow all ip addresses
                                                               // or add a specific IPv4 of 192.168.1.5 :
                                                               // ["127.0.0.1", "::ffff:127.0.0.1", "::1", "::ffff:192.168.1.5"],
                                                               // or IPv4 range of 192.168.3.0 --> 192.168.3.15 use CIDR format :
                                                               // ["127.0.0.1", "::ffff:127.0.0.1", "::1", "::ffff:192.168.3.0/28"],

        useHttps: false,                // Support HTTPS or not, default "false" will use HTTP
        httpsPrivateKey: "",    // HTTPS private key path, only require when useHttps is true
        httpsCertificate: "",   // HTTPS Certificate path, only require when useHttps is true

        language: "nl",
        timeFormat: 24,
        units: "metric",
        // serverOnly:  true/false/"local" ,
                             // local for armv6l processors, default
                             //   starts serveronly and then starts chrome browser
                             // false, default for all  NON-armv6l devices
                             // true, force serveronly mode, because you want to.. no UI on this device

        modules: [
                {
                        module: "alert",
                },
                {
                        module: "updatenotification",
                        position: "top_bar"
                },
                {
                        module: "clock",
                        position: "top_left"
                },

                {
                         module: 'MMM-MyTraffic',
                         position: 'top_left',
                         header: 'My Traffic Information',
                         config: {
                                 showJams: true,                // Show Traffic jams
                                 showConstructions: true,       // Show Constructions
                                 showRadars: true,              // Show Speed Traps (Radar Controls)
                                 largeIcons: true,              // Show Large or Small icons
                                 maxWidth: "500px",             // Max width wrapper
                                 preferredRoads: ['A12','A4']   // Show All roads or show you're selection -> ['A1','A50','A67']
                                 }
                },
                {
						module: 'MMM-MyDutchWeather',
						position: 'top_right',
						header: 'Weer',
						config: {
						latitude: "52.090736",			// Latitude of your city
						longitude: "5.121420",			// Longitude of your city
						apiKey: "5f155f01bf",				// API Key - Get for free at http://weerlive.nl/api/toegang/index.php
						showIcons: true,			// Display Icons or Text
						showExtra: true,			// Display additional weather information
						maxWidth: "500px"			// Max width wrapper
  }
},
                {
                        module: 'MMM-RSS-FEED',
                        position: 'top_bar',
                        config: {
                                url: 'https://www.telegraaf.nl/rss'
                                }
                },
                {
                        module: 'MMM-Remote-Control',
                        // uncomment the following line to show the url of the remote control on the mirror
//                      position 'lower_third',
                        //you can hide this module afterwards from the remote control itself
//                      config  {
//                              customCommand: {},
//                              customMenu: "",
//                              showModuleApiMenu: true,
//                              apiKey: ""
//                              }
                },
        ]

};

/*************** DO NOT EDIT THE LINE BELOW ***************/
if (typeof module !== "undefined") {module.exports = config;}
