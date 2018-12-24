# Cole Reynolds

river <- read.csv(paste0(here::here(), "/data/gleditsch_river_data.csv"))
river <- river[1:22]
colnames(river) <- c("state_A", "state_A_name", "contiguity", "shared_river", "num_shared_rivers", "river_type", "rivers", "river_boundaries_length", "total_length", "drainage_basins", "basin_size_km2", "total", "size_basin_state_A", "total_1", "size_basin_stateB", "total_2", "upstream_state", "upstream_state_avg", "state_B", "state_B_name", "contiguity_start_year", "contiguity_end_year")

mon_river <- river[0:0,1:21]
colnames(mon_river)[21] <- "year"

for( i in 1:nrow(river)){
  for( j in river[i,"contiguity_start_year"]:river[i,"contiguity_end_year"]){
    mon_river <- rbind(mon_river, river[i,1:21])
    mon_river[nrow(mon_river), 21] <- j
  }
}

write.csv(mon_river, paste0(here::here(), "/data/river_monadic.csv"))
