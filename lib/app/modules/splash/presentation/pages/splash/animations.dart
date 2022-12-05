enum Type { normal, big }

class AnimationState {
  final double size;
  final Type type;
  AnimationState({
    required this.size,
    required this.type,
  });

  factory AnimationState.normal() {
    return AnimationState(size: 13, type: Type.normal);
  }
  factory AnimationState.big() {
    return AnimationState(size: 16, type: Type.big);
  }
}
