const ICON = 'https://jploskonka.github.io/trello-hill-chart/icon.svg';

window.TrelloPowerUp.initialize({
  'card-back-section': function(t, options) {
    return {
      title: 'Scope progress',
      icon: ICON,
      content: {
        type: 'iframe',
        url: t.signUrl('./section.html'),
        height: 250
      }
    }
  },
  'card-badges': function(t, options) {
    return t.card('id')
      .get('id')
      .then(function(cardId) {
        return fetch(`https://trello-hill-chart.herokuapp.com/scopes/${cardId}`)
          .then(function(response) { return response.json(); })
          .then(function(response) {
            const text = response.progress < 10 ? 'warming up'
              : response.progress >= 10 && response.progress < 50 ? 'figuring out'
              : response.progress >= 50 && response.progress < 90 ? 'making it'
              : 'almost there'

            const color = response.progress < 10 ? 'gray'
              : response.progress >= 10 && response.progress < 50 ? 'orange'
              : response.progress >= 50 && response.progress < 90 ? 'yellow'
              : 'lime'

            return [{
              text: text,
              color: color
            }]
          })
      })
  }
});
