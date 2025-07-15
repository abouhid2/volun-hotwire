# Hotwire Demo Application

This is a simple Rails application that demonstrates the power of Hotwire, focusing on Turbo Streams and ActionCable for real-time updates.

## What is Hotwire?

Hotwire is a modern approach to building web applications without writing much JavaScript. It consists of three main components:

1. **Turbo**: Provides several techniques for creating fast, modern web applications without writing custom JavaScript.
2. **Stimulus**: A modest JavaScript framework for adding small behaviors to your HTML.
3. **Strada**: A bridge between your web app and native mobile applications (not used in this demo).

## Key Components Used in This Demo

### Turbo Streams

Turbo Streams deliver page changes as HTML fragments over WebSockets, SSE, or other transport protocols. They allow you to update multiple parts of a page simultaneously without a full page refresh.

In this demo, Turbo Streams are used to:

- Add new messages to the page in real-time
- Update messages when edited
- Remove messages when deleted
- Show notifications

### ActionCable

ActionCable is Rails' built-in WebSocket framework that integrates with Turbo to provide real-time updates. It establishes a persistent connection between the server and client, allowing for instant updates across all connected clients.

## How It Works (Numbered Steps)

1. **Model Broadcasting**: The Message model broadcasts changes using `broadcasts_to ->(message) { :messages }`.
2. **Stream Subscription**: The view subscribes to these broadcasts with `<%= turbo_stream_from :messages %>`.
3. **DOM Targeting**: Each message has a unique DOM ID via `dom_id` helper, allowing Turbo to target specific elements.
4. **Controller Responses**: The controller responds to Turbo Stream format in addition to HTML and JSON.
5. **Turbo Stream Templates**: Custom templates (create/update/destroy.turbo_stream.erb) define how the DOM should be updated.

## Running the Application

1. Make sure you have Ruby and Rails installed
2. Clone this repository
3. Run the following commands:

```bash
# Install dependencies
bundle install

# Set up the database
rails db:create db:migrate

# Start the Rails server
bin/dev
```

4. Open your browser to http://localhost:3000
5. Try opening multiple browser windows to see real-time updates across them!

## Testing the Real-Time Features

1. Open the application in two browser windows side by side
2. Create a new message in one window
3. Watch it appear instantly in the other window
4. Edit or delete a message in one window
5. See the changes reflected immediately in the other window

## Learning More

To learn more about Hotwire:

- [Hotwire Official Documentation](https://hotwired.dev/)
- [Turbo Handbook](https://turbo.hotwired.dev/handbook/introduction)
- [ActionCable Overview](https://guides.rubyonrails.org/action_cable_overview.html)
