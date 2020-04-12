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
                        module: "calendar",
                        header: "Agenda",
                        position: "center",
                        config: {
                                calendars: [
                                        {
                                                symbol: "calendar-check",
                                                url: "webcal://www.calendarlabs.com/ical-calendar/ics/76/US_Holidays.ics"                                       }
                                ]
                        }
                },

				{
						module: "MMM-Spotify",
						position: "bottom_right",
						config: {
									style: "default", // "default" or "mini" available
									control: "default", //"default", "hidden" available
									updateInterval: 1000,
									onStart: null, // disable onStart feature with `null`
									allowDevices: [], //If you want to limit devices to display info, use this.
									// allowDevices: ["RASPOTIFY", "My iPhoneX", "My Home speaker"],
								}
				},
				onStart: {
							deviceName: "RASPOTIFY", //if null, current(last) activated device will be.
							spotifyUri: "spotify:track:3ENXjRhFPkH8YSH3qBXTfQ"
							//when search is set, sportifyUri will be ignored.
							search: {
										type: "playlist", // `artist`, track`, `album`, `playlist` and its combination(`artist,playlist,album`) be available
										keyword: "death metal",
										random:true,
									}
						},
				{
						module: "MMM-Strava",
						position: "bottom_left",
						config: {
									client_id: "your_strava_client_id",
									client_secret: "your_strava_api_client_secret"
								}
				},
				{
						module: 'MMM-MyPrayerTimes',
						position: 'top_right',
						header: 'My Prayer Times',
						config: {
									mptLat: "52.070499",				// Replace with the latitude of your location
									mptLon: "4.300700",				// Replace with the Longitude of your location
									mptMethod: 3,			// Which calculation methode is used, see options below
									mptOffset: "0,0,0,0,0,0,0,0,0"	// Time corrections for your location: Imsak, Fajr, Sunrise, Duhr, Asr, Sunset, Maghrib, Isha, Midnight
									showSunrise: true,			// Display Sunrise, false if you want to hide
									showSunset: true,			// Display Sunset, false if you want to hide
									showMidnight: true,			// Display Midnight, false if you want to hide
									showImsak: true,			// Display Imsak, false if you want to hide
									show24Clock: true,			// Default display 24hour clock -> false is 12hour (AM/PM) clock
								}
				},
				{
						module: "MMM-chromecast",
						position: "top",
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
						latitude: "52.070499",			// Latitude of your city
						longitude: "4.300700",			// Longitude of your city
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
