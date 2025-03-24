//
// Youtube Subscriptions to OMPL
// This script will generate an OMPL file with all your Youtube subscriptions.
//
// Open your Youtube subscriptions page (https://www.youtube.com/feed/channels)
// and then run this script in the browser console.
//

const subscribedChannels = JSON.stringify(ytInitialData.contents).match(/"channelId":\s*"([^"]+)",\s*"title":\s*{\s*"simpleText":\s*"([^"]+)"\s*}/g)
channels = ['<?xml version="1.0" encoding="UTF-8"?>\n<opml version="1.0">\n<body>\n<outline text="YouTube Subscriptions" title="YouTube Subscriptions">'];
subscribedChannels.map(channel => {
    const channelId = channel.match(/"channelId":\s*"([^"]+)"/)[1];
    const channelName = channel.match(/"title":\s*{\s*"simpleText":\s*"([^"]+)"\s*}/)[1];
    channels.push(`<outline type="rss" text="${channelName}" title="${channelName}" xmlUrl="https://www.youtube.com/feeds/videos.xml?channel_id=${channelId}" />`);
});
channels.push("</outline>", "/body>", "</opml>");
const omplData = channels.join("\n");
var blob = new Blob([omplData], { type: 'text/xml' });
var a = document.createElement('a');
a.href = URL.createObjectURL(blob);
a.download = 'subscriptions.opml';
a.click();
