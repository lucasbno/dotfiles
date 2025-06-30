-- Tabbed module configuration and signal examples
-- This file demonstrates how to use and extend the bling tabbed module

local naughty = require("naughty")

-- Signal connections for tabbed functionality
-- These are optional but can be useful for debugging or extending functionality

-- Signal triggered whenever a tabbed object is updated
awesome.connect_signal("bling::tabbed::update", function(tabobj)
    -- You can add custom logic here when tabs are updated
    -- For example, logging or custom notifications
    -- naughty.notify({
    --     title = "Tab Updated",
    --     text = "Tab group has been updated"
    -- })
end)

-- Signal triggered when a client is added to a tab group
awesome.connect_signal("bling::tabbed::client_added", function(tabobj, client)
    -- Custom logic when a client joins a tab group
    -- Notifications disabled for now
    -- naughty.notify({
    --     title = "Client Tabbed",
    --     text = "Client '" .. (client.name or "Unknown") .. "' added to tab group",
    --     timeout = 3
    -- })
end)

-- Signal triggered when a client is removed from a tab group
awesome.connect_signal("bling::tabbed::client_removed", function(tabobj, client)
    -- Custom logic when a client leaves a tab group
    -- Notifications disabled for now
    -- naughty.notify({
    --     title = "Client Untabbed",
    --     text = "Client '" .. (client.name or "Unknown") .. "' removed from tab group",
    --     timeout = 3
    -- })
end)

-- Signal triggered when tab group focus changes
awesome.connect_signal("bling::tabbed::changed_focus", function(tabobj)
    -- Custom logic when focus changes within a tab group
    -- This can be useful for updating status indicators or other UI elements
end)

-- Optional: Auto-tab certain application types
-- This is an example of how you might automatically group certain applications
client.connect_signal("manage", function(c)
    -- Example: Auto-tab all terminal windows
    if c.class and (c.class:lower():find("terminal") or c.class:lower():find("alacritty")) then
        -- You could automatically add terminals to existing tab groups
        -- This is just an example - uncomment if you want this behavior
        -- local focused = client.focus
        -- if focused and focused.class and focused.class:lower():find("terminal") then
        --     bling.module.tabbed.add(c, focused)
        -- end
    end
end)
