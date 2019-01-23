export default function(){
  this.transition(
    this.fromRoute('/'),
    this.toRoute('index'),
    this.use('toLeft'),
    this.reverse('toRight')
  );
}
