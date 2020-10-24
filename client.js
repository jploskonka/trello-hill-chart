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
  }
});
