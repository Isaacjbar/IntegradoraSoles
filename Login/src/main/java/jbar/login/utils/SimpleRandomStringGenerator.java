package jbar.login.utils;

import java.util.Random;

public class SimpleRandomStringGenerator {

    // Conjunto de caracteres permitidos
    private static final String CHARACTERS = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
    private static final Random RANDOM = new Random();

    public static String generateRandomString(int length) {
        if (length <= 0) {
            throw new IllegalArgumentException("La longitud debe ser mayor que 0.");
        }

        char[] text = new char[length];
        for (int i = 0; i < length; i++) {
            text[i] = CHARACTERS.charAt(RANDOM.nextInt(CHARACTERS.length()));
        }
        return new String(text);
    }

    public static void main(String[] args) {
        int length = 10; // Especificar la longitud deseada
        String randomString = generateRandomString(length);
        System.out.println("Cadena aleatoria: " + randomString);
    }
}
