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
              : response.progress >= 10 && response.progress < 50 ? 'unknown'
              : response.progress >= 50 && response.progress < 90 ? 'known'
              : response.progress < 96 ? 'almost there' : 'done'

            const color = response.progress < 10 ? 'gray'
              : response.progress >= 10 && response.progress < 50 ? 'orange'
              : response.progress >= 50 && response.progress < 90 ? 'yellow'
              : response.progress < 96 ? 'lime' : 'green'

            return [{
              text: text,
              color: color
            }]
          })
      })
  }
});
