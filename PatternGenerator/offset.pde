//this recalculates som variable required for making the cut-off spikes

void adjustOffsetVariables(float offsetMagnitude) {

  globalOffset = offsetMagnitude;
    effectiveXoffset = effectiveSpikeHeight / ((effectiveSpikeWidth/2)/globalOffset); 
  while (effectiveXoffset > effectiveSpikeHeight) {
    effectiveXoffset = effectiveXoffset-effectiveSpikeHeight;
  }
 
  while (globalOffset > effectiveSpikeWidth/2) {
    globalOffset = globalOffset - effectiveSpikeWidth/2;
  }
  /*
println("------------------------------------------");
println("globalOffset: " + globalOffset);
println("effectiveOffset: " + effectiveOffset);
println("effectiveXoffset: " + effectiveXoffset);
println("------------------------------------------");
*/
}