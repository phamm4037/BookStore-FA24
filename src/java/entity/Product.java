package entity;

import java.math.BigDecimal;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Builder
@Data
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter

public class Product {
    private int product_id;
    private int category_id;
    private String title;
    private String author;
    private String publisher;
    private int publication_year;
    private BigDecimal price;
    private int stock_quantity;
    private String description;
    private String image_url;
    
    @Override
    public String toString() {
        return "Product{" +
                "product_id=" + product_id +
                ", category_id=" + category_id +
                ", title='" + title + '\'' +
                ", author='" + author + '\'' +
                ", publisher='" + publisher + '\'' +
                ", publication_year=" + publication_year +
                ", price=" + price +
                ", stock_quantity=" + stock_quantity +
                ", description='" + description + '\'' +
                ", image_url='" + image_url + '\'' +
                '}';
    }
}
