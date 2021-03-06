package com.mfile.controller;



import com.mfile.controller.dto.cover.CoverCreateDto;
import com.mfile.controller.dto.cover.CoverUpdateDto;
import com.mfile.exceptions.ResourceNotFoundException;
import com.mfile.model.Cover;
import com.mfile.service.ICoverService;
import com.mfile.technical.dto.DTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.actuate.health.Health;
import org.springframework.boot.actuate.health.HealthIndicator;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/cover")
public class CoverController implements HealthIndicator {

    @Autowired
    private ICoverService coverService;

    @GetMapping("/{id}")
    public @ResponseBody Cover getCover(@PathVariable String id) {

        return coverService.find( id );
    }

    @GetMapping("/all")
    public @ResponseBody List<Cover> coverList(){

        List<Cover> coverList = coverService.findAll();
        if (coverList.isEmpty()) throw new ResourceNotFoundException( "Aucune couverture de livre trouvée");

        return coverList;
    }

    @PostMapping("/save")
    @ResponseStatus(HttpStatus.OK)
    public Cover save(@DTO(CoverCreateDto.class) @RequestBody Cover cover)  {
        return coverService.save( cover );
    }

    @PutMapping("/update")
    @ResponseStatus(HttpStatus.OK)
    public void update(@DTO(CoverUpdateDto.class) @RequestBody Cover cover){

                coverService.save( cover );
    }

    @DeleteMapping("/{id}")
    public boolean delete(@PathVariable String id){

        return coverService.delete( id );
    }

    @Override
    public Health health() {
        List<Cover> coverList = coverService.findAll();

        if(coverList.isEmpty()) {
            return Health.down().build();
        }
        return Health.up().build();
    }
}
